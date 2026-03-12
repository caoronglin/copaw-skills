#!/usr/bin/env python3
"""
腾讯机器翻译 (Tencent Machine Translation)
使用腾讯云 TMT API 进行文本翻译
"""
import os
import sys
import json
import hashlib
import hmac
import time
from datetime import datetime
import requests

# 从环境变量获取 API 密钥
SECRET_ID = os.getenv("TENCENT_SECRET_ID", "")
SECRET_KEY = os.getenv("TENCENT_SECRET_KEY", "")

# 语言代码映射
LANG_MAP = {
    "en": "en",
    "zh": "zh",
    "cn": "zh",
    "ja": "ja",
    "ko": "ko",
    "fr": "fr",
    "de": "de",
    "es": "es",
    "it": "it",
    "ru": "ru",
    "pt": "pt",
    "ar": "ar",
    "hi": "hi",
}

def get_current_timestamp():
    """获取当前时间戳（秒）"""
    return int(time.time())

def get_current_date():
    """获取当前日期 (YYYY-MM-DD)"""
    return datetime.utcnow().strftime("%Y-%m-%d")

def sign_tc3(secret_key, date, service, string_to_sign):
    """TC3-HMAC-SHA256 签名"""
    def _hmac_sha256(key, msg):
        return hmac.new(key, msg.encode("utf-8"), hashlib.sha256).digest()
    
    def _sha256_hex(s):
        return hashlib.sha256(s.encode("utf-8")).hexdigest()
    
    secret_date = _hmac_sha256(("TC3" + secret_key).encode("utf-8"), date)
    secret_service = _hmac_sha256(secret_date, service)
    secret_signing = _hmac_sha256(secret_service, "tc3_request")
    signature = hmac.new(secret_signing, string_to_sign.encode("utf-8"), hashlib.sha256).hexdigest()
    return signature

def translate(text, target_lang="en", source_lang="auto"):
    """调用腾讯机器翻译 API"""
    if not SECRET_ID or not SECRET_KEY:
        return {"success": False, "error": "请配置 TENCENT_SECRET_ID 和 TENCENT_SECRET_KEY 环境变量"}
    
    # 参数配置
    endpoint = "tmt.tencentcloudapi.com"
    service = "tmt"
    action = "TextTranslate"
    version = "2018-03-21"
    region = "ap-guangzhou"
    
    # 目标语言
    target_lang = LANG_MAP.get(target_lang.lower(), "en")
    source_lang = "auto" if source_lang == "auto" else LANG_MAP.get(source_lang.lower(), "auto")
    
    # 构建请求参数
    params = {
        "SourceText": text,
        "Source": source_lang,
        "Target": target_lang,
        "ProjectId": 0,
    }
    
    # 签名计算
    timestamp = get_current_timestamp()
    date = get_current_date()
    
    # CanonicalRequest
    http_request_method = "POST"
    canonical_uri = "/"
    canonical_query_string = ""
    canonical_headers = f"content-type:application/json\nhost:{endpoint}\n"
    signed_headers = "content-type;host"
    hashed_request_payload = hashlib.sha256(json.dumps(params).encode("utf-8")).hexdigest()
    canonical_request = (
        f"{http_request_method}\n"
        f"{canonical_uri}\n"
        f"{canonical_query_string}\n"
        f"{canonical_headers}\n"
        f"{signed_headers}\n"
        f"{hashed_request_payload}"
    )
    
    # StringToSign
    algorithm = "TC3-HMAC-SHA256"
    credential_scope = f"{date}/{service}/tc3_request"
    hashed_canonical_request = hashlib.sha256(canonical_request.encode("utf-8")).hexdigest()
    string_to_sign = (
        f"{algorithm}\n"
        f"{timestamp}\n"
        f"{credential_scope}\n"
        f"{hashed_canonical_request}"
    )
    
    # 计算签名
    signature = sign_tc3(SECRET_KEY, date, service, string_to_sign)
    
    # 构建 Authorization header
    authorization = (
        f"{algorithm} "
        f"Credential={SECRET_ID}/{credential_scope}, "
        f"SignedHeaders={signed_headers}, "
        f"Signature={signature}"
    )
    
    # 发送请求
    url = f"https://{endpoint}"
    headers = {
        "Authorization": authorization,
        "Content-Type": "application/json",
        "Host": endpoint,
        "X-TC-Action": action,
        "X-TC-Version": version,
        "X-TC-Timestamp": str(timestamp),
        "X-TC-Region": region,
    }
    
    try:
        response = requests.post(url, headers=headers, json=params, timeout=10)
        result = response.json()
        
        # 解析响应
        if "Response" in result and "TargetText" in result["Response"]:
            return {
                "success": True,
                "source_text": text,
                "translated_text": result["Response"]["TargetText"],
                "source_lang": result["Response"].get("Source", source_lang),
                "target_lang": target_lang,
            }
        elif "Response" in result and "Error" in result["Response"]:
            return {
                "success": False,
                "error": result["Response"]["Error"]["Message"],
                "code": result["Response"]["Error"]["Code"],
            }
        else:
            return {
                "success": False,
                "error": "未知错误",
                "detail": result,
            }
    except Exception as e:
        return {
            "success": False,
            "error": str(e),
        }

def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("用法: python translate.py <文本> [目标语言]")
        print("示例: python translate.py '你好世界' en")
        print("      python translate.py 'hello world' zh")
        sys.exit(1)
    
    text = sys.argv[1]
    target_lang = sys.argv[2] if len(sys.argv) > 2 else "en"
    
    result = translate(text, target_lang)
    
    if result["success"]:
        print(f"\n原文: {result['source_text']}")
        print(f"译文: {result['translated_text']}")
        print(f"({result['source_lang']} -> {result['target_lang']})")
    else:
        print(f"\n翻译失败: {result.get('error', '未知错误')}")
        if "code" in result:
            print(f"错误码: {result['code']}")
        sys.exit(1)

if __name__ == "__main__":
    main()
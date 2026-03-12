#!/usr/bin/env python3
"""
腾讯云 API 通用调用工具
支持调用腾讯云各种服务的 API
使用腾讯云官方 Python SDK
"""
import os
import sys
import json

# 尝试导入腾讯云 SDK
try:
    from tencentcloud.common import credential
    from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
    from tencentcloud.tmt.v20180321 import tmt_client
    from tencentcloud.tmt.v20180321 import models as tmt_models
except ImportError:
    print("请安装腾讯云 SDK: pip install tencentcloud-sdk-python")
    sys.exit(1)

def get_credential():
    """获取认证对象"""
    secret_id = os.getenv("TENCENT_SECRET_ID")
    secret_key = os.getenv("TENCENT_SECRET_KEY")
    
    if not secret_id or not secret_key:
        raise ValueError("请配置 TENCENT_SECRET_ID 和 TENCENT_SECRET_KEY 环境变量")
    
    return credential.Credential(secret_id, secret_key)

def translate_text(text, target_lang="zh", source_lang="auto"):
    """
    翻译文本
    
    参数:
        text: 要翻译的文本
        target_lang: 目标语言 (zh, en, ja, ko, fr, de, es, it, ru, pt, ar, hi)
        source_lang: 源语言 (auto 自动检测)
    
    返回:
        dict: 翻译结果
    """
    cred = get_credential()
    client = tmt_client.TmtClient(cred, "ap-guangzhou")
    
    request = tmt_models.TextTranslateRequest()
    request.SourceText = text
    request.Source = source_lang
    request.Target = target_lang
    request.ProjectId = 0
    
    try:
        response = client.TextTranslate(request)
        result = response.to_json_string()
        data = json.loads(result)
        return {
            "success": True,
            "source_text": text,
            "translated_text": data.get("TargetText", ""),
            "source_lang": data.get("Source", source_lang),
            "target_lang": target_lang,
        }
    except TencentCloudSDKException as e:
        return {
            "success": False,
            "error": str(e),
        }
    except Exception as e:
        return {
            "success": False,
            "error": f"翻译失败: {str(e)}",
        }

def call_api(service, action, params=None, region="ap-guangzhou"):
    """
    通用 API 调用（通过翻译接口示例）
    """
    # 特殊处理翻译服务
    if service == "tmt" and action == "TextTranslate":
        return translate_text(
            params.get("SourceText", ""),
            params.get("Target", "zh"),
            params.get("Source", "auto")
        )
    
    return {"success": False, "error": f"暂不支持服务 {service} 的 {action} 接口"}

def list_services():
    """列出支持的服务和操作"""
    print("\n支持的腾讯云服务：")
    print("-" * 50)
    print("  tmt             - 机器翻译 (TextTranslate)")
    print("-" * 50)

def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("用法:")
        print("  翻译文本: python tencent_api.py translate <文本> [目标语言]")
        print("  示例:")
        print("    python tencent_api.py translate 'hello' zh")
        print("    python tencent_api.py translate '你好' en")
        print()
        list_services()
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "translate":
        if len(sys.argv) < 3:
            print("用法: python tencent_api.py translate <文本> [目标语言]")
            print("目标语言: zh, en, ja, ko, fr, de, es, it, ru, pt, ar, hi")
            sys.exit(1)
        
        text = sys.argv[2]
        target = sys.argv[3] if len(sys.argv) > 3 else "zh"
        
        result = translate_text(text, target)
        
        if result["success"]:
            print(f"\n原文: {result['source_text']}")
            print(f"译文: {result['translated_text']}")
            print(f"({result['source_lang']} -> {result['target_lang']})")
        else:
            print(f"\n翻译失败: {result.get('error', '未知错误')}")
            sys.exit(1)
    else:
        print(f"未知命令: {command}")
        sys.exit(1)

if __name__ == "__main__":
    main()
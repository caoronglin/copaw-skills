#!/usr/bin/env python3
import requests
import json
import base64
import os
import sys
from typing import Optional

# API 配置
API_URL = "https://ai.cnortles.top/v1/chat/completions"
API_KEY = "your_image_recognition_api_key_here"
MODEL_NAME = "PaddlePaddle/PaddleOCR-VL-1.5"

def encode_image_to_base64(image_path: str) -> Optional[str]:
    """将本地图片编码为 base64 格式"""
    try:
        with open(image_path, "rb") as f:
            return base64.b64encode(f.read()).decode("utf-8")
    except Exception as e:
        print(f"图片编码失败: {e}")
        return None

def recognize_image(
    image_source: str,
    prompt: str = "请详细描述这张图片的内容，包括文字、场景、物体等所有信息",
    is_local: bool = True
) -> Optional[str]:
    """
    识别图片内容
    :param image_source: 图片路径（本地）或 URL（网络）或 base64 编码
    :param prompt: 识别提示词
    :param is_local: 是否为本地图片
    """
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {API_KEY}"
    }
    
    # 处理图片内容
    if is_local:
        # 本地图片
        base64_image = encode_image_to_base64(image_source)
        if not base64_image:
            return None
        image_url = f"data:image/jpeg;base64,{base64_image}"
    elif image_source.startswith(("http://", "https://")):
        # 网络图片
        image_url = image_source
    else:
        # 已经是 base64 格式
        if image_source.startswith("data:image"):
            image_url = image_source
        else:
            image_url = f"data:image/jpeg;base64,{image_source}"
    
    # 构造请求
    payload = {
        "model": MODEL_NAME,
        "messages": [
            {
                "role": "user",
                "content": [
                    {
                        "type": "text",
                        "text": prompt
                    },
                    {
                        "type": "image_url",
                        "image_url": {
                            "url": image_url
                        }
                    }
                ]
            }
        ],
        "max_tokens": 2048,
        "temperature": 0.1
    }
    
    try:
        response = requests.post(API_URL, headers=headers, json=payload, timeout=60)
        response.raise_for_status()
        result = response.json()
        
        if "choices" in result and len(result["choices"]) > 0:
            return result["choices"][0]["message"]["content"].strip()
        else:
            print(f"API 返回格式异常: {result}")
            return None
            
    except Exception as e:
        print(f"图片识别请求失败: {e}")
        if hasattr(e, 'response') and e.response is not None:
            print(f"响应内容: {e.response.text}")
        return None

def main():
    if len(sys.argv) < 2:
        print("Usage: ")
        print("  识别本地图片: python image_recognize.py <本地图片路径> [提示词]")
        print("  识别网络图片: python image_recognize.py --url <图片URL> [提示词]")
        print("  识别base64: python image_recognize.py --base64 <base64字符串> [提示词]")
        sys.exit(1)
    
    if sys.argv[1] == "--url":
        if len(sys.argv) < 3:
            print("请提供图片URL")
            sys.exit(1)
        image_source = sys.argv[2]
        is_local = False
        prompt = sys.argv[3] if len(sys.argv) > 3 else "请详细描述这张图片的内容，包括文字、场景、物体等所有信息"
    elif sys.argv[1] == "--base64":
        if len(sys.argv) < 3:
            print("请提供base64字符串")
            sys.exit(1)
        image_source = sys.argv[2]
        is_local = False
        prompt = sys.argv[3] if len(sys.argv) > 3 else "请详细描述这张图片的内容，包括文字、场景、物体等所有信息"
    else:
        image_source = sys.argv[1]
        is_local = True
        prompt = sys.argv[2] if len(sys.argv) > 2 else "请详细描述这张图片的内容，包括文字、场景、物体等所有信息"
    
    result = recognize_image(image_source, prompt, is_local)
    if result:
        print("✅ 图片识别结果:")
        print(result)
        sys.exit(0)
    else:
        print("❌ 图片识别失败")
        sys.exit(1)

if __name__ == "__main__":
    main()

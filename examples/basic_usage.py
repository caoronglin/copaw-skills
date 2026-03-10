#!/usr/bin/env python3
"""
CoPaw Skills 使用示例 - 天气推送
演示如何使用多个技能组合完成实际任务
"""
import os
from dotenv import load_dotenv

load_dotenv()

def example_weather():
    """使用高德地图查询天气"""
    from mcp_amap import AmapClient
    client = AmapClient(api_key=os.getenv('AMAP_API_KEY'))
    weather = client.get_weather(location='杨凌')
    print(f"🌤️ 杨凌天气：{weather['text']} {weather['temp']}°C")

def example_arxiv():
    """使用 arXiv 搜索论文"""
    from mcp_arxiv import ArxivClient
    client = ArxivClient()
    papers = client.search(query="CRISPR", max_results=3)
    print(f"\n📚 找到 {len(papers)} 篇论文:")
    for p in papers:
        print(f"- {p['title'][:60]}...")

def example_gene():
    """使用 BioMCP 查询基因"""
    from mcp_biomcp import BioMCPClient
    client = BioMCPClient()
    gene = client.search_gene("TP53")
    print(f"\n🧬 {gene['symbol']}: {gene['name']}")

if __name__ == '__main__':
    print("CoPaw Skills 示例")
    print("=" * 40)
    example_weather()
    example_arxiv()
    example_gene()

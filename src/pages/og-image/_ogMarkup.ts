import { html } from "satori-html";
import { siteConfig } from "@/site.config";

const siteHost = new URL(siteConfig.url).host;

// OG image markup, use https://og-playground.vercel.app/ to design your own.
export const ogMarkup = (title: string, pubDate: string) =>
	html`<div tw="flex flex-col w-full h-full bg-[#121212] text-[#c9cacc] justify-between p-12">
		<div tw="flex flex-col flex-1 justify-center">
			<p tw="text-xl mb-4 text-[#888888] font-mono">${pubDate}</p>
			<h1 tw="text-5xl font-bold leading-tight text-white">${title}</h1>
		</div>
		<div tw="flex items-center justify-between w-full pt-8 border-t border-[#333333] text-white">
			<p tw="text-2xl font-bold tracking-tight">${siteConfig.title}</p>
			<p tw="text-xl text-[#888888] font-mono">${siteHost}</p>
		</div>
	</div>`;

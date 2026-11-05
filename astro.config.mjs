import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
const repo = process.env.GITHUB_REPOSITORY?.split('/')[1];
const owner = process.env.GITHUB_REPOSITORY_OWNER;
const isUserSite = repo && owner && repo.toLowerCase() === `${owner.toLowerCase()}.github.io`;
export default defineConfig({site: owner ? `https://${owner}.github.io` : 'http://localhost:4321', base: repo && !isUserSite ? `/${repo}` : '/', integrations:[mdx()]});

import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';
const projects = defineCollection({loader:glob({pattern:'**/*.{md,mdx}',base:'./src/content/projects'}),schema:z.object({title:z.string(),category:z.string(),period:z.string(),order:z.number(),summary:z.string(),role:z.string(),focus:z.string(),lead:z.string(),cover:z.string().nullable().default(null),coverAlt:z.string().default(''),heroCover:z.string().optional(),heroAlt:z.string().optional(),imageNote:z.string().optional(),credits:z.string().default(''),draft:z.boolean().default(false),links:z.array(z.object({label:z.string(),url:z.string().url()})).default([])})});
export const collections = {projects};

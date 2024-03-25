import { Hono } from "hono";
import { serveStatic } from "hono/bun";

const app = new Hono();

app.use(async (ctx, next) => {
	// Set security headers needed for SharedArrayBuffer
	ctx.header("Cross-Origin-Opener-Policy", "same-origin");
	ctx.header("Cross-Origin-Embedder-Policy", "require-corp");
	await next();
});

app.use(
	"*",
	serveStatic({
		root: "./out",
	})
);

export default {
	port: 3000,
	fetch: app.fetch,
};

console.log("Server is running on port 3000");

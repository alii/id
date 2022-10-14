module main

import vweb

const content = '|   __    __
|  / \\\\..// \\\n|    ( oo )
|     \\__/
|
|
|  software engineer
|
|  hi@alistair.sh
|  https://twitter.com/alistaiiiir
|  https://alistair.sh
|  served by {{hop-edge-node}}@hop.io
'

struct App {
	vweb.Context
}

fn main() {
	vweb.run_at(&App{}, vweb.RunParams{
		port: 8080
	}) or {
		panic(err)
	}
}

pub fn (mut app App) index() vweb.Result {
	node := app.req.header.get_custom('x-hop-edge-node') or { 'local' }

	println(node)

	return app.text(content.replace('{{hop-edge-node}}', node))
}

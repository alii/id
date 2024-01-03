module main

import vweb

const content = '|   __    __
|  / \\\\..// \\\n|    ( oo )
|     \\__/
|
|
|  software engineer
|
|  discord @alistaiir <@268798547439255572>
|  hi@alistair.sh
|  https://twitter.com/alistaiir
|  https://alistair.sh
|  served by {{hop-edge-node}}@hop.io
'

struct App {
	vweb.Context
}

fn main() {
	vweb.run_at(&App{}, vweb.RunParams{
		port: 8080
	}) or { panic(err) }

	println('listening on port 8080')
}

['/']
pub fn (mut app App) index() vweb.Result {
	node := app.req.header.get_custom('Hop-Edge-Node') or { 'local' }

	return app.text(content.replace('{{hop-edge-node}}', node))
}

['/headers']
pub fn (mut app App) print_headers() vweb.Result {
	return app.json(app.req.header)
}

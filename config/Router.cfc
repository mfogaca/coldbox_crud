component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		route("", "Main.index");
		route( "/nova-mensagem", "Main.newMensagem" );
		route( "/alterar-mensagem/:id?", "Main.getMensagem" );
		route( "/salvar-mensagem/", "Main.saveMensagem" );		
		route( "/excluir-mensagem/:id?", "Main.deleteMensagem" );			

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}

<html>
	<!--- Metatags --->
	<meta charset="utf-8">
	<!---css --->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<style>
		.text-blue { color:##379BC1; }
	</style>

	<!--- Title --->
	<title>Teste de Conclusão do Curso ColdFusion - SENAC/2022</title>
	<body>

		<cfoutput>
			<div class="span10">
					<form class="navbar-form pull-right">
						<a class="btn btn-primary" href="#event.getHTMLBaseURL()#index.cfm/#event.getCurrentModule()#nova-mensagem">
							<i class="icon-plus icon-white"></i> 
							Nova Mensagem
						</a>
					</form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Assunto</th>
							<th>Destinatário</th>
							<th>Data da Mensagem</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
						<cfloop array="#prc.qMensagens#" index="q">						
							<tr>
								<td>
									#q.getAssunto()#
								</td>
								<td>
									#q.getDestinatario()#
								</td>
								<td>
									#LSDateFormat(q.getDatamensagem(),"dd/mm/yyyy")#
								</td>
								<td>
									<a href="#event.getHTMLBaseURL()#index.cfm/#event.getCurrentModule()#alterar-mensagem/#q.getId()#">
										<i class="icon-edit"></i>
										Alterar
									</a>
									<a href="#event.getHTMLBaseURL()#index.cfm/#event.getCurrentModule()#excluir-mensagem/#q.getId()#">
										<i class="icon-edit"></i>
										Excluir
									</a>
								</td>
							</tr>
						</cfloop>
					</tbody>
				</table>
			</div>	
		</cfoutput>
	</body>
</html>
<html>
    <!--- Metatags --->
    <meta charset="utf-8">
    <!---css --->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        .text-blue { color:##379BC1; }

        body {
            text-align: center;
        }
    </style>

    <!--- Title --->
    <title>Teste de Conclusão do Curso ColdFusion - SENAC/2022</title>
    <body>
        <cfoutput>
            <cfif !isNull(prc.errors) AND prc.errors.hasErrors()>
                <div class="alert alert-danger">
                    <strong>Erro!</strong><br />
                    Ocorreram os seguintes erros :
                    <ul>
                        <cfloop array="#prc.errors.getErrors()#" index="error">
                            <li>#error.message#</li>
                        </cfloop>
                    </ul>
                </div>
            </cfif>
            <h2>Formulário</h2>
                <form class="form-horizontal" action="#event.getHTMLBaseURL()#index.cfm/#event.getCurrentModule()#salvar-mensagem" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="#((isDefined('prc.record')) ? prc.record.getId(): ((isDefined('rc.id')) ? rc.id : ""))#" />                    
                    <div class="control-group">
                        <label class="control-label" for="assunto">Assunto</label>
                        <div class="controls">
                            <input type="text" id="assunto" name="assunto" value="#((isDefined('prc.record')) ? prc.record.getAssunto(): ((isDefined('rc.assunto')) ? rc.assunto : ""))#">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="mensagem">Mensagem</label>
                        <div class="controls">
                            <textarea rows="3" id="mensagem" name="mensagem">#((isDefined('prc.record')) ? prc.record.getMensagem(): ((isDefined('rc.mensagem')) ? rc.mensagem : ""))#</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dataMensagem">Data da Mensagem</label>
                        <div class="controls">
                            <input type="text" id="dataMensagem" name="dataMensagem" value="#((isDefined('prc.record')) ? prc.record.getDataMensagem(): ((isDefined('rc.datamensagem')) ? rc.datamensagem : ""))#">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="destinatario">Destinatário</label>
                        <div class="controls">
                            <!--- <cfdump var="#prc.destinatarios#" abort="true"> --->
                            <select name="destinatario">
                                <option value="">Selecione o Destinatário</option>
                                <cfloop array="#prc.destinatarios#" index="d">
                                    <option value="#d.code#" <cfif !isNull(prc.record) AND d.code EQ prc.record.getDestinatario()>selected</cfif>>#d.value#</option>
                                    <!--- <option value="#d.code#">#d.value#</option>--->
                                </cfloop>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-primary">Salvar</button>
                        </div>
                    </div>
                </form>
            </div>
        </cfoutput>
    </body>
</html>
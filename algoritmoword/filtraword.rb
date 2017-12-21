require File.expand_path("encontrastr.rb")
require "net/http"

$padrao = Regexp::new("title=")
$dados = {}
True = 1 #true

class Filtro < Object

    def initialize()
        @site = "http://www.globo.com"
        @resultado = []
    end


    def texto()
        # Pega o conteudo do site.
        conteudo = Net::HTTP.get(URI.parse(@site)).split("><")
        conteiner = []

        conteudo.each do |item|
            # Busca um determinado padrao.
            if item.match($padrao)
                conteiner.insert(-1, item)
            end
        end

        conteiner.each do |string|
            # Encontra o comedo do texto.
            indice = buscar("title=", string)[1]
            parada = 0
            texto = ""

            while True
                # Procura o texto separa e coloca as palavra em um array.
                if parada == 2
                    if buscar("href=", texto)
                        #pass

                    else
                        coloca_palavra(texto.split(" "),
                            @resultado)
                    end
                    break
                end

                if indice == string.length
                    if buscar("href=", texto)
                        #pass

                    else
                        coloca_palavra(texto.split(" "),
                            @resultado)
                    end
                    break

                elsif string[indice] == '"'
                    parada += 1
                end

                texto += string[indice]
                indice = indice + 1
            end
        end

        while True
            # Contagem do numero de ocorrencia da palavra.
            @resultado.each do |palavra|
                ocorrencia = @resultado.count(palavra)
                girar = 0
                while girar < ocorrencia
                    begin
                        girar = girar + 1
                        @resultado.delete_at(@resultado.index(palavra))
                    rescue TypeError
                        #pass
                    end
                end

                $dados[palavra] = ocorrencia
            end

            if @resultado.length == 0
                return True
            end
        end
    end

    def ordem_ocorrencia()
        #Organiza em ordem de ocorrencia.
        copia = {}.merge($dados)
        ordem = []

        while True
            aux = 0
            oco_max = {}
            for chave, valor in copia.each_pair()
                for chave_dois, valor_dois in $dados.each_pair()
                    if valor >= valor_dois and valor > aux
                        aux = valor
                        oco_max = {}
                        oco_max[chave] = valor
                    end
                end
            end

            ordem.insert(-1, oco_max.each_pair().next()[0])
            copia.delete(oco_max.keys()[0])
            exibir = oco_max.each_pair().next()
            puts "Numero de ocorrencia da palavra/letra [%s] = [%i]" % [exibir[0], exibir[1]]

            if copia.length == 0
                return True
            end
        end
    end
end


if __FILE__ == $0
   filtro = Filtro.new()
   filtro.texto()
   filtro.ordem_ocorrencia()
end
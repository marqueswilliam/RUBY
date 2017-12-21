def buscar(word, string)
    de = 0
    ate = 0

    (0..string.length).each do |x|
        de += 1
        if string[x..x + 1] == word[0,2]
            if string[x + 2..x + 3] == word[2..3]
                ate = (de - 1) + word.length
                #puts "Palavra encontrada [#{de - 1}:#{ate}]"
                return [de - 1, ate]
            else
                if string[x..x + 2] == word
                    ate = (de - 1) + word.length
                    #puts "Palavra encontrada [#{de - 1}:#{ate}]"
                    return [de - 1, ate]
                end
            end
        else
            #pass
        end
    end
    return nil
end


def coloca_palavra(lista_in, lista_out, tipo_palavra = nil)
    lista_in.each do |palavra|
        if tipo_palavra == "grande"
            lista_out.insert(-1, palavra.upcase().gsub('"', ""))

        elsif tipo_palavra == "pequeno"
            lista_out.insert(-1, palavra.downcase().gsub('"', ""))

        else
            lista_out.insert(-1, palavra.gsub('"', ""))
        end
    end
end
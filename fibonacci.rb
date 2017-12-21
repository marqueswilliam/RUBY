$antigo = 0
$novo = 1

def fibonacci(sequencia)
	if (sequencia != 0)
		puts $novo

	else
		return true
	end

	$antigo, $novo = $novo, $antigo + $novo
	fibonacci(sequencia - 1)
end

if (__FILE__ == $0)
	fibonacci(5)
end
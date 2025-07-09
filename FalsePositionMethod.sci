function y = f(x)
    y = 1 - (1 + x).^-9 - (140 / 26.5) * x  // função que procura a raiz
endfunction

a = 0.12
b = 0.13
x = a  // calcula o primeiro erro relativo

while (1)
    x_anterior = x  // guarda o valor do x para cálculo do erro relativo
    x = a - (b - a) * f(a) / (f(b) - f(a))  // ponto em que a reta que liga os intervalos corta o eixo
    erro_relativo = abs((x - x_anterior) / x)  // calcula o erro relativo
    if (erro_relativo < 10^-3) then
        break
    end
    if (f(a) * f(x) < 0) then  // verifica em que intervalo está a raiz, método de Bolzano
        b = x  // redefine o intervalo, a raiz está no intervalo da direita
    else
        a = x  // redefine o intervalo, a raiz está no intervalo da direita
    end
end

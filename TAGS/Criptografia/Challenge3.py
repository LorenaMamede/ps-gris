import codecs
from heapq import heappop, heappush, heapify 

frequencia_letras_ingles ={
    'a' : 8.167,
    'b' : 1.492,
    'c' : 2.202,
    'd' : 4.253,
    'e' : 12.702,
    'f' : 2.228,
    'g' : 2.015,
    'h' : 6.094,
    'i' : 6.966,
    'j' : 0.153,
    'k' : 1.292,
    'l' : 4.025,
    'm' : 2.406,
    'n' : 6.749,
    'o' : 7.507,
    'p' : 1.929,
    'q' : 0.095,
    'r' : 5.987,
    's' : 6.327,
    't' : 9.356,
    'u' : 2.758,
    'v' : 0.978,
    'w' : 2.560,
    'x' : 0.150,
    'y' : 1.994,
    'z' : 0.077,
    '*' : -1000,
}


hex_string="1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
decode_hex_string = codecs.decode(hex_string, 'hex')

heap = []
heapify(heap)
possiveis_mensagens = {}
for possivel_char in range(256):
    xord_string = b''
    for byte in decode_hex_string:
        xord_string += bytes([byte ^ possivel_char])
    
    ocorrencias = []
    for byte in xord_string:
        porcentagem = frequencia_letras_ingles.get(chr(byte), 0)
        ocorrencias.append(porcentagem)
    heappush(heap, sum(ocorrencias) * -1)
    possiveis_mensagens[sum(ocorrencias)] = xord_string
    
mensagem_original = possiveis_mensagens.get(-1 * heap[0])
print(mensagem_original) 

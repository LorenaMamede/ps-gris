import codecs

hex_string1 = "1c0111001f010100061a024b53535009181c"
hex_string2 = "686974207468652062756c6c277320657965"
decode_hex_string1 = codecs.decode(hex_string1, 'hex')
decode_hex_string2 = codecs.decode(hex_string2, 'hex')

xord_string = b''

for byte1, byte2 in zip(decode_hex_string1, decode_hex_string2):
    xord_string += bytes([byte1 ^ byte2])
resultado = codecs.encode(xord_string, 'hex')
print(resultado)


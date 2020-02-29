import codecs

decode_hex_string = codecs.decode("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d", 'hex')
encoded_b64_string = codecs.encode(decode_hex_string, 'base64')

print(encoded_b64_string)


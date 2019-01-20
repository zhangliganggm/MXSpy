import os

self_path = os.getcwd()

file_lst = []

mxspy_ms = os.path.join(self_path, 'MxsPy.ms')
file_lst.append(mxspy_ms)

mxspy_lib_folder = os.path.join(self_path, "Lib")
for f in os.listdir(mxspy_lib_folder):
    full_filename = os.path.join(mxspy_lib_folder, f)
    file_lst.append(full_filename)

output_filename = os.path.join(self_path, "compiled.ms")

code = ""

global_code = ""

for f in file_lst:
    with open(f, 'r') as fobj:
        code += fobj.read() + "\n"

        global_code += "global {m}=MXS{m};".format(m=os.path.basename(f).split('.')[0])

for _ in range(1, 10)[::-1]:
    code = code.replace('\r' * _, '')
    code = code.replace('\n\r' * _, '\n')
    code = code.replace('\n' * _, '\n')
    code = code.replace('\t' * _, '')

for _ in range(2, 10)[::-1]:
    code = code.replace(' ' * _, '')


version_code = open(mxspy_ms, 'r').readlines()[1].strip()


for _ in range(1, 10)[::-1]:
    code = code.replace(';' * _, ';')

head_code = """(--mxspy
{version_code};
base64data = "{b64}";
dotnet_encoding = dotnetclass "System.Text.Encoding";ascii_object = dotnet_encoding.ASCII;dotnet_convert = dotnetclass "Convert";bytes_data = dotnet_convert.FromBase64String(base64data);real_data = ascii_object.Default.GetString(bytes_data);
execute real_data;
OK
)
"""

import base64

code = "(" + code + ")" + global_code

code = base64.b64encode(code.encode()).decode()

base64_mxs_code = ""

for i, t in enumerate(code):

    base64_mxs_code += code[i]

    if i % 300 == 0:
        base64_mxs_code += "\"+\n\""

print(head_code.format(version_code=version_code, b64 = str(base64_mxs_code)))

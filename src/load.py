import os

os.system("gnatmake -gnaty hear")
print("1")
os.system("gcc -c -gnaty hear.adb")
print("2")
os.system("gnatbind -x hear.ali")
print("3")
os.system("gnatlink hear.ali") 
print("4")
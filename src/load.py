import os

os.system("gcc -c -gnaty hear.adb")
print("1")
os.system("gnatbind -x hear.ali")
print("2")
os.system("gnatlink hear.ali") 
print("3")
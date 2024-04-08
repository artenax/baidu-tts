import tkinter as tk
import os

class BaiduTranslatorApp:
    def __init__(self, master):
        self.master = master
        master.title("Baidu Translator")

        self.text_entry = tk.Text(master, height=10, width=50)
        self.text_entry.pack()

        self.ok_button = tk.Button(master, text="OK", command=self.save_to_file)
        self.ok_button.pack(side=tk.LEFT)

        self.cancel_button = tk.Button(master, text="Отмена", command=master.quit)
        self.cancel_button.pack(side=tk.RIGHT)

    def save_to_file(self):
        text_content = self.text_entry.get("1.0", tk.END).strip()
        with open("/tmp/input.txt", "w") as file:
            file.write(text_content)
        os.system("/home/denis/ui/baidu-translator.sh")

def main():
    root = tk.Tk()
    app = BaiduTranslatorApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()

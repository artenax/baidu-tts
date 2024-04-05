import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import subprocess

class FileChooserWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="File Chooser Example")

        self.set_border_width(10)

        box = Gtk.Box(spacing=6)
        self.add(box)

        button = Gtk.Button("Choose File")
        button.connect("clicked", self.on_file_clicked)
        box.add(button)

    def on_file_clicked(self, widget):
        dialog = Gtk.FileChooserDialog("Please choose a file", self, Gtk.FileChooserAction.OPEN,
            (Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
             Gtk.STOCK_OPEN, Gtk.ResponseType.OK))

        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            print("File selected: " + dialog.get_filename())
            # Здесь вызываем ваш sh-скрипт и передаем путь к файлу как аргумент
            subprocess.run(["/home/denis/ui/baidu-tts.sh", dialog.get_filename()])
        elif response == Gtk.ResponseType.CANCEL:
            print("Cancel clicked")

        dialog.destroy()

win = FileChooserWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()

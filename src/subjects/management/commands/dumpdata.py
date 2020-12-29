from optparse import make_option

from django.core.management.commands.dumpdata import Command as Dumpdata

class Command(Dumpdata):

    def add_arguments(self, parser):
        super(Command, self).add_arguments(parser)
        parser.add_argument('--pretty', default=False, action='store_true', 
            dest='pretty', help='Avoid unicode escape symbols'
        )

    
    def handle(self, *args, **kwargs):
        data = super(Command, self).handle(*args, **kwargs)
        if kwargs.get('pretty'):
            data = data.decode("unicode_escape").encode("utf8")
        return data
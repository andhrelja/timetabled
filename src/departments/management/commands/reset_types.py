from django.core.management.base import BaseCommand
from accounts.models import StudentSubjects
from activities_score.constraints import TYPE_CHOICES
from activities_score.activities_global.models import GlobalScoreActivity
from subjects.models import Subject, SubjectPrograms
from tqdm import tqdm

find_type = lambda type_name: [typ[0] for typ in TYPE_CHOICES if typ[1] == type_name]


class Command(BaseCommand):
    help = 'Resets any type discrepancies'

    def handle(self, *args, **options):
        self.reset_types()
        self.ingest_points(13)
    
    def reset_types(self, filter=None):
        print("Reseting types ...")
        for global_score_activity in tqdm(list(GlobalScoreActivity.objects.all())): # filter={'id__in': (388, 393)}
            if global_score_activity.name != global_score_activity.get_type_display():
                global_score_activity.delete()
            else:
                global_score_activity.type = find_type(global_score_activity.name)[0]
                global_score_activity.save()

    def ingest_points(self, program_id):
        print("Ingesting points ...")
        if program_id:
            subject_ids = SubjectPrograms.objects.filter(program_id=program_id).values_list('subject_id')
            subjects = Subject.objects.filter(id__in=subject_ids)
        else:
            subjects = Subject.objects.all()
        
        for ss in tqdm(StudentSubjects.objects.filter(subject__in=subjects)):
            ss.ingest_points()



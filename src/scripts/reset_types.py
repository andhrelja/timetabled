from activities_score.constraints import TYPE_CHOICES
from activities_score.activities_global.models import GlobalScoreActivity

find_type = lambda type_name: [typ[0] for typ in TYPE_CHOICES if typ[1] == type_name]

def reset_types():
    for global_score_activity in GlobalScoreActivity.objects.filter(id__in=(388, 393)):
        if global_score_activity.name != global_score_activity.get_type_display():
            global_score_activity.delete()
        else:
            global_score_activity.type = find_type(global_score_activity.name)


from pygal.style import CleanStyle

text_primary    = "#4582ec"
text_secondary  = "#adb5bd"
text_success    = "#02b875"
text_info       = "#17a2b8"
text_danger     = "#d9534f"
text_warning    = "#f0ad4e"

style_score_activities_pie = CleanStyle(
    colors=(text_success, text_danger)
)

style_class_activities_pie = CleanStyle(
    colors=(text_info, text_warning)
)

style_score_activities_bar = CleanStyle(
    colors=(text_danger, text_warning, text_info, text_secondary, text_primary, text_success)
)

style_class_activities_bar = CleanStyle(
    colors=(text_danger, text_warning, text_info, text_secondary, text_primary, text_success)
)
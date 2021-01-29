from pygal.style import CleanStyle

text_primary    = "#4582ec"
text_secondary  = "#adb5bd"
text_success    = "#02b875"
text_info       = "#17a2b8"
text_danger     = "#d9534f"
text_warning    = "#f0ad4e"

style_score_activities_pie = CleanStyle(
    colors=(text_success, text_danger),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=20,
)

style_class_activities_pie = CleanStyle(
    colors=(text_info, text_warning),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=20,
)

style_score_activities_bar = CleanStyle(
    colors=(text_info, text_primary),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=18,
)

style_class_activities_bar = CleanStyle(
    colors=(text_danger, text_warning, text_info, text_secondary, text_primary, text_success),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=18,
)

style_semester_days_pie = CleanStyle(
    colors=(text_success, text_warning),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=18,
)

style_number_gauge = CleanStyle(
    colors=(text_danger, text_warning, text_info, text_secondary, text_primary, text_success),
    font_family='googlefont:Raleway',
    title_font_size=48,
    label_font_size=16,
    major_label_font_size=12,
    tooltip_font_size=20,
    legend_font_size=18,
)
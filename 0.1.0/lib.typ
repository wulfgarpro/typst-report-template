#let titlepage(
  title: "Report",
  subtitle: none,
  date: datetime.today(),
  logo: none, // content
  title_font: "Libertinus Serif",
  title_size: 36pt,
  subtitle_size: 16pt,
  date_size: 11pt,
  top_gap: 6cm,
  title_logo_width: 2cm,
  subtitle_gap: 0.35cm,
  date_gap: 0.25cm,
  document_id: "XXXXXXXX.XX",
) = {
  set page(
    footer: align(right)[
      #document_id
    ],
  )

  if logo != none {
    align(right)[
      #box(width: title_logo_width)[#logo]
    ]
  }

  v(top_gap)

  align(right)[
    #text(font: title_font, size: title_size, weight: "bold")[#title]

    #if subtitle != none {
      v(subtitle_gap)
      text(font: title_font, size: subtitle_size)[#subtitle]
    }

    #v(date_gap)
    #text(size: date_size)[#datetime.display(date, "[year]-[month]-[day]")]
  ]
}

#let report(
  title: "Report",
  subtitle: none,
  date: datetime.today(),
  logo: none,
  paper: "us-letter",
  margin: (top: 1in, bottom: 1in, left: 1.1in, right: 1.1in),
  body_font: "Libertinus Serif",
  body_size: 11pt,
  justify: true,
  show_outline: true,
  title_logo_width: 2cm,
  header_logo_width: 1.1cm,
  header_ascent: 0.6cm,
  document_id: "XXXXXXXX.XX",
  doc,
) = {
  set page(paper: paper, margin: margin)
  set text(font: body_font, size: body_size)
  set par(justify: justify)
  set heading(numbering: "1.1)")

  titlepage(
    title: title,
    subtitle: subtitle,
    date: date,
    logo: logo,
    title_logo_width: title_logo_width,
    document_id: document_id,
  )

  pagebreak()
  counter(page).update(1)

  set page(
    header: align(right)[
      #if logo != none {
        box(width: header_logo_width)[#logo]
      } else {
        text(weight: "bold")[#title]
      }
    ],
    numbering: "1",
    header-ascent: header_ascent,
    footer: {
      grid(
        columns: (1fr, auto),
        align: (left, right),

        [#context {
          let current = counter(page).get().first()
          let total = counter(page).final().first()
          numbering("1", current) + " / " + numbering("1", total)
        }],

        [#document_id],
      )
    },
  )

  if show_outline {
    outline()
    pagebreak()
  }

  doc
}

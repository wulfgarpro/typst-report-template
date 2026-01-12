#import "@local/typst-report-template:0.1.0": report

#show: doc => report(
  title: "Report Title",
  subtitle: "Subtitle",
  logo: image("logo.png"),
  doc,
)

= Introduction
#lorem(120)
#lorem(150)

== Sub Heading
#lorem(100)

=== Sub Sub Heading
#lorem(80)

#pagebreak()

= Appendices

== Appendix 1
#lorem(80)

== Appendix 2
#lorem(80)

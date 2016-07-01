# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

#Mime::Type.unregister(:pdf)
#Mime::Type.register "application/force-download", :pdf, [], %w(pdf)

Mime::Type.unregister(:pdf)

octet_stream = MIME::Types["application/octet-stream"].first
octet_stream.extensions << "mts"
MIME::Types.add octet_stream
octet_stream = MIME::Types["application/octet-stream"].first
octet_stream.extensions << "psd"
MIME::Types.add octet_stream


Mime::Type.register "application/force-download", :pdf, [], %w(pdf)
# Mime::Type.register "application/octet-stream", :mts, [], %w(mts)

Mime::Type.register "application/vnd.ms-office", :pot, [], %w(pot)
Mime::Type.register "application/vnd.ms-office", :ppt, [], %w(ppt)
Mime::Type.register "application/vnd.ms-office", :xls, [], %w(xls)
Mime::Type.register "application/vnd.ms-office", :xlt, [], %w(xlt)

Mime::Type.register "text/x-markdown", :md, [], %w(md)
Mime::Type.register "text/html", :mm, [], %w(mm)

Mime::Type.register "application/vnd.oasis.opendocument.presentation", :odp, [], %w(odp)
Mime::Type.register "application/vnd.oasis.opendocument.spreadsheet", :ods, [], %w(ods)

# Microsoft https://technet.microsoft.com/en-us/library/ee309278%28office.12%29.aspx
# http://filext.com/faq/office_mime_types.php
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx, [], %w(xlsx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.template", :xltx, [], %w(xltx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.presentationml.template", :potx, [], %w(potx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.presentationml.slideshow", :ppsx, [], %w(ppsx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.presentationml.presentation", :pptx, [], %w(pptx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.presentationml.slide", :sldx, [], %w(sldx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.wordprocessingml.document", :docx, [], %w(docx)
Mime::Type.register "application/vnd.openxmlformats-officedocument.wordprocessingml.template", :dotx, [], %w(dotx)
Mime::Type.register "application/vnd.ms-excel.addin.macroEnabled.12", :xlam, [], %w(xlam)
Mime::Type.register "application/vnd.ms-excel.sheet.binary.macroEnabled.12", :xlsb, [], %w(xlsb)

Mime::Type.register "application/vnd.ms-word.document.macroEnabled.12", :docm, [], %w(docm)
Mime::Type.register "application/vnd.ms-excel.sheet.macroEnabled.12", :xlsm, [], %w(xlsm)
Mime::Type.register "application/vnd.ms-excel.template.macroEnabled.12", :xltm, [], %w(xltm)
Mime::Type.register "application/vnd.ms-powerpoint.presentation.macroEnabled.12", :pptm, [], %w(pptm)
Mime::Type.register "application/vnd.ms-powerpoint.slideshow.macroEnabled.12", :ppsm, [], %w(ppsm)
Mime::Type.register "application/vnd.ms-powerpoint.template.macroEnabled.12", :potm, [], %w(potm)
Mime::Type.register "application/vnd.ms-powerpoint.addin.macroEnabled.12", :ppam, [], %w(ppam)
Mime::Type.register "application/vnd.ms-powerpoint.slide.macroEnabled.12", :sldm, [], %w(sldm)
Mime::Type.register "application/msonenote", :one, [], %w(one onetoc2 onetmp onepkg)
Mime::Type.register "application/vnd.ms-officetheme", :thmx, [], %w(thmx)
Mime::Type.register "application/msword", :doc, [], %w(doc dot)
Mime::Type.register "application/vnd.ms-word.template.macroEnabled.12", :dotm, [], %w(dotm)


# disable spoof check :(
# unfortunately, Firefox is causing many troubles...

module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
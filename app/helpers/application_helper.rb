module ApplicationHelper

  def title_sentence(list,position)
    @titles = []
    list.each do |movie|
      @titles << movie[position]
    end
    @titles.to_sentence
  end

  def description_sentence_upcoming
    @titles = []
    @opening_movies_list.each { |opening_movies| @titles << "#{opening_movies[0]}" }
    @upcoming_movies_list.each { |upcoming_movies| @titles << "#{upcoming_movies[0]} in theatres #{upcoming_movies[1].to_date.strftime('%A %B %-e')}" }
    @titles.to_sentence
  end

  def description_sentence_current
    @titles = []
    @list.each { |movie| @titles << "#{movie[1]} review" }
    @titles.to_sentence
  end

  def nicer_quote(description)
    "&#8220;#{description}&#8221;".html_safe
  end

  def slug_line
    today = Date.today
    "Movies worth watching, #{today.strftime('%b ')} #{today.strftime('%d').to_i.ordinalize}."
  end

  def upcoming_date(date)
    if date <= Date.tomorrow
      "In theatres now!"
    else
      dotiw = distance_of_time_in_words(Date.today, date)
      "Opens in #{dotiw}"
    end
  end

  def upcoming_interested(score)
    "#{score}% public interest"
  end

  def truncate_title(title)
    truncate(title, length: 30, separator: ' ')
  end

  def trailer_data(title)
    Rails.cache.fetch("cached_data_#{title}", expires_in: 1.day) do
      @item = @client.videos_by(query: title, max_results: 1, most_popular: true)
      @item.videos.first.media_content.first.url
    end
  end

  def trailer_title
      @item.videos.first.title
  end

  def trailer_link(movie_title)
    link_to trailer_logo + "Trailer", trailer_data(movie_title), title: trailer_title
  end

# Images
  def upcoming_poster(movie)
    image_tag(movie[3], alt: movie[0], size: "40x60")
  end

  def disc_poster(url,title)
    image_tag(url, alt: title, size: "100x148")
  end

  def favicon
        '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ef8ZH3r/GR98/xkffv8ZH33/GR96/xkeef8YHnn/GB55/xgeef8YHnn/GB55/xkeef8ZH3r/GR98/xkffv8ZIIH/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xkggf8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GSCB/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAAAACkAAABSAAAAAQAgAAAAAACINAAAAAAAAAAAAAAAAAAAAAAAABohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkggf8ZIIH/GSCB/xkg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/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/j6vH/DRFF/zg8av+gp7r/oKWx/8PK0P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/tbvD/5+mtv9NUXv/Exlj/xgedv8WHG//P0R3/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/yMmUP8XGkv/3+jv/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/9vi6v8PEUX/Ki1d/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/5GXrf8SFlr/Fx1y/xcccf8ZHV7/6/T5/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/TlF1/w8SSv+KkKr/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/0dni/w8SSv8PEkv/3+jv/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/vcTR/xEVVv8WHG//GB11/xQZYf/J0N3/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P95fp3/ERVU/zA0af/t9vv/7vf8/+73/P/u9/z/7vf8/+73/P/J0d3/ERRT/xEVVf+1vc7/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/n7vX/FBdZ/xYcb/8ZHnn/FRtr/6Cmwv/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/6SrxP8UGWH/Exli/661zP/u9/z/7vf8/+73/P/u9/z/7vf8/8LJ2v8UGWH/Exlj/42TtP/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P/u9/z/7vf8/+73/P86Pnv/Fx1y/xkfff8YHnX/b3Sn/9Xd6v/V3en/1d3p/9Td6P/U3ej/1N3o/9Td6P/U3ej/1N3p/9Xd6f/V3er/uL/X/xYccP8XHHH/UlaS/9Xd6v/V3en/1d3p/9Xd6f/V3en/qK/M/xYcb/8XHHH/X2Sc/9Xd6v/V3en/1d3p/9Td6P/U3ej/1N3o/9Td6P/U3ej/1N3o/9Xd6f/V3en/1d3q/1tgmv8YHnj/GSCA/xkfff8ZHnn/Fx10/xcdcf8XHHD/Fhxw/xYccP8WHHD/Fhxw/xYccP8XHHD/Fxxx/xcdc/8YHnf/GR96/xkfe/8YHnj/GB11/xcdcv8XHHD/Fx1x/xcdc/8YHnf/GR96/xkfe/8YHnj/GB11/xcdcv8XHHD/Fhxw/xYccP8WHHD/Fhxw/xYccP8WHHD/Fxxw/xcdcv8YHnX/GR96/xogff8ZIIH/GSCA/xogf/8aIH7/GiB9/xogff8aIH3/GiB9/xogff8aIH3/GiB9/xogff8aIH3/GiB+/xogf/8ZIID/GSCA/xogf/8aIH7/GiB+/xogff8aIH3/GiB+/xogf/8ZIID/GSCA/xogf/8aIH7/GiB9/xogff8aIH3/GiB9/xogff8aIH3/GiB9/xogff8aIH3/GiB9/xogfv8aIH//GSCA/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8aIYL/GiGC/xohgv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
  end

  def imdb_logo
'<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAARCAYAAABXax
X/AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZ
G9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5U
Y3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkF
kb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgIC
AgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyL
XJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1w
PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmF
kb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veG
FwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9za
G9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUY2MTA2REJFQjFG
MTFFMEI3MEU5NDE3OTBFMTEyRTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUY2MTA2REN
FQjFGMTFFMEI3MEU5NDE3OTBFMTEyRTIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdG
FuY2VJRD0ieG1wLmlpZDpBRjYxMDZEOUVCMUYxMUUwQjcwRTk0MTc5MEUxMTJFMiIgc3RSZWY6Z
G9jdW1lbnRJRD0ieG1wLmRpZDpBRjYxMDZEQUVCMUYxMUUwQjcwRTk0MTc5MEUxMTJFMiIvPiA8
L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0
iciI/PhCZn1kAAATKSURBVHjajFVba1xVFP72ucw5c5/JJL2kTa0mrU1TDAaKt9oHFUQfBH+DoC
9iQQTBl5k8KOJL6EtBHyxF4otXUPTFNCI+VCUSrEmDSZqSGpPWjJnJXM45+1y26+yTTDJ2Urtgz
Zm99mV9e61vrc2EEAjF3viypFrniz6S8L3Iti3ef8Ytuxt0tnvt420fnSRQT4z2Dp4vhf81afDr
JWF9VXQ4xz/rPv5PPL4DwvP3duS7e5/B7QAxU0Gue7bIG7OIJU+WWPPvj0rgk0WfzxEQFamUiny
B7WxyPMQMrTVuNukG6o4tnG/UVaQzu8F6sG3AsQSMOINpRvbqRjvw1RULqaxCQPqQ7nlulNWWHp
crtoGEh84vH8T0jA/DNPDIsIs/ljSs3ebygCcedrFR1zEzH4HpzgZ4cACYmtHh2I60dSVsHD8K9
PRsYnruAG7eCuRZp0+sUc5s2JaPRtVGMmvCqkVRTqQ9aEzJoVauSiDhLXTSK1MeXnr1R+SyaXwx
/iTGLsxhYvK63PThhWdx9fdbeGdsGnEDOHmqF2Nvn8a5N3/CZmUVtQZDPm/gwP4CPr14HF9fbuK
9se/x0NAxTHx+DHGzihuzf+HKVQdnRgykcypqFR+qlocSotQTKQhmIHAFBJHVNBnSSYEEqa6DVC
CfC20+Fhc3Ua15BBTSFtdcqAqQTATY12PitVdG0JMHFuYX8e1lG/u6FQLNkElxvH/JwctvNLB0+
z48fSYPI8EomkJyJxT56zbrkXphhexNSE3XcONPgdU1FzG1nei+58LiOl58oR/ptEkXMolbMQRc
g6YpKFc4xj+bxcefTGPs4jqB76I5G4zStu1TaWO45SII2p04jtP6n0rG8PPUTSws1YlbiY6A643
2cueuT2QOcP+hLrz1+jMU3Xh0Lo9cu54hv1bDh8IdH0KNS+W+goDSZNt3RocpJvqO9qNSWZfaPz
Cwq490rmHP5zCT0Vnct+VX1diu0g+orQipMjKuy+ByR6psftGe1iZFMRCuUZWASNgnbVQYGBo8j
CaBDkRA83s0NEqR3WAdm59PALhHlw+iKg0BtaUpJPNuMYRGi3fSdKQ3JQmt6ialTCeeOFCY0loT
N/TIUcA6gmNsx+5yXxaL2Oruns/awchcWmKLkAIO8+hgdavFcxTy0Vwhn0U2vU62oBW9yEETl8b
nUKtZNGdLvkjiU0vaqDQx/dvKVveN3guHIh5q1CiJM+SD2Gy2tW9BADxh0k1SLZAWj6Er41NJm8
jlNGQNBZZDZGTxrbRSpAIFEz8swHYU6j/9OPtYDE3LCmNGRE3hm4llcm5g+FQGDBWEtbK7Xti17
0aEGlOQThmSwNWyB6EXsLGZlgt6MlXUbUZcCkE4aDSjKJiqTZ04ukQ+uYGanSce8K2oqshkXRgo
o2Z1o06Vk03rRANO3VjH4OEyRacm12aoQbqWDYt8sPLyB6W1lcmiqFxDYX+SbkJR2GwQL+7IIOQ
ld0lMi9Lk2J05EqbA0EVHeyi5Aj0HmxZF3cDBBx4dZSHDw1d76ZdzRbvyqwQURuhuL/XdXuu9Xu
pOzTSMSN3SMHT23dHCoadK8rVT1FSp+8jzuL4+XSyXjVaptTtnuBcJiXiv4tg+Ut3DEkg4/leAA
QB3omZvywBDqQAAAABJRU5ErkJggg=="
 alt="IMDB" width="35" height="17" class="imdb">'.html_safe
  end

  def trailer_logo
'<img src="data:image/gif;base64,
R0lGODlhHwASAIABAI2Njf7+/iH5BAEAAAEALAAAAAAfABIAAAJBjI+py+0PIwK02ovxDID7
Dn5i2B3ZiVZJuS7s1iqv6cq1jcPxrtN57wMaZsOb0PMLDlPMy4Y0ikJfzSpFgs1qDQUAOw=="
 alt="::" width="31" height="18" class="video">'.html_safe
  end
end
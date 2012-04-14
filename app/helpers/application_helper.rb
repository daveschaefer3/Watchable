module ApplicationHelper
  def title_sentence
    # used in the title tag
    [@title_1, @title_2, @title_3, @title_4, @title_5].to_sentence
  end

  def title_review_list
    # used in the meta description tag
    @title_1 << " review, " <<
    @title_2 << " review, " <<
    @title_3 << " review, " <<
    @title_4 << " review, " <<
    @title_5 << " review"
  end
  
  def slug_line
    # used as the site's slogan of-sorts
    "Movies worth watching, " << Date.today.strftime('%b ') << Date.today.strftime('%d').to_i.ordinalize << "."
  end

  def imdb_logo
    '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAARCAYAAABXaxX/AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUY2MTA2REJFQjFGMTFFMEI3MEU5NDE3OTBFMTEyRTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUY2MTA2RENFQjFGMTFFMEI3MEU5NDE3OTBFMTEyRTIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBRjYxMDZEOUVCMUYxMUUwQjcwRTk0MTc5MEUxMTJFMiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBRjYxMDZEQUVCMUYxMUUwQjcwRTk0MTc5MEUxMTJFMiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhCZn1kAAATKSURBVHjajFVba1xVFP72ucw5c5/JJL2kTa0mrU1TDAaKt9oHFUQfBH+DoC9iQQTBl5k8KOJL6EtBHyxF4otXUPTFNCI+VCUSrEmDSZqSGpPWjJnJXM45+1y26+yTTDJ2UrtgzZm99mV9e61vrc2EEAjF3viypFrniz6S8L3Iti3ef8Ytuxt0tnvt420fnSRQT4z2Dp4vhf81afDrJWF9VXQ4xz/rPv5PPL4DwvP3duS7e5/B7QAxU0Gue7bIG7OIJU+WWPPvj0rgk0WfzxEQFamUinyB7WxyPMQMrTVuNukG6o4tnG/UVaQzu8F6sG3AsQSMOINpRvbqRjvw1RULqaxCQPqQ7nlulNWWHpcrtoGEh84vH8T0jA/DNPDIsIs/ljSs3ebygCcedrFR1zEzH4HpzgZ4cACYmtHh2I60dSVsHD8K9PRsYnruAG7eCuRZp0+sUc5s2JaPRtVGMmvCqkVRTqQ9aEzJoVauSiDhLXTSK1MeXnr1R+SyaXwx/iTGLsxhYvK63PThhWdx9fdbeGdsGnEDOHmqF2Nvn8a5N3/CZmUVtQZDPm/gwP4CPr14HF9fbuK9se/x0NAxTHx+DHGzihuzf+HKVQdnRgykcypqFR+qlocSotQTKQhmIHAFBJHVNBnSSYEEqa6DVCCfC20+Fhc3Ua15BBTSFtdcqAqQTATY12PitVdG0JMHFuYX8e1lG/u6FQLNkElxvH/JwctvNLB0+z48fSYPI8EomkJyJxT56zbrkXphhexNSE3XcONPgdU1FzG1nei+58LiOl58oR/ptEkXMolbMQRcg6YpKFc4xj+bxcefTGPs4jqB76I5G4zStu1TaWO45SII2p04jtP6n0rG8PPUTSws1YlbiY6A6432cueuT2QOcP+hLrz1+jMU3Xh0Lo9cu54hv1bDh8IdH0KNS+W+goDSZNt3RocpJvqO9qNSWZfaPzCwq490rmHP5zCT0Vnct+VX1diu0g+orQipMjKuy+ByR6psftGe1iZFMRCuUZWASNgnbVQYGBo8jCaBDkRA83s0NEqR3WAdm59PALhHlw+iKg0BtaUpJPNuMYRGi3fSdKQ3JQmt6ialTCeeOFCY0loTN/TIUcA6gmNsx+5yXxaL2Oruns/awchcWmKLkAIO8+hgdavFcxTy0Vwhn0U2vU62oBW9yEETl8bnUKtZNGdLvkjiU0vaqDQx/dvKVveN3guHIh5q1CiJM+SD2Gy2tW9BADxh0k1SLZAWj6Er41NJm8jlNGQNBZZDZGTxrbRSpAIFEz8swHYU6j/9OPtYDE3LCmNGRE3hm4llcm5g+FQGDBWEtbK7Xti170aEGlOQThmSwNWyB6EXsLGZlgt6MlXUbUZcCkE4aDSjKJiqTZ04ukQ+uYGanSce8K2oqshkXRgoo2Z1o06Vk03rRANO3VjH4OEyRacm12aoQbqWDYt8sPLyB6W1lcmiqFxDYX+SbkJR2GwQL+7IIOQld0lMi9Lk2J05EqbA0EVHeyi5Aj0HmxZF3cDBBx4dZSHDw1d76ZdzRbvyqwQURuhuL/XdXuu9XupOzTSMSN3SMHT23dHCoadK8rVT1FSp+8jzuL4+XSyXjVaptTtnuBcJiXiv4tg+Ut3DEkg4/leAAQB3omZvywBDqQAAAABJRU5ErkJggg==" alt="IMDB" width="35" height="17" class="imdb">'.html_safe
  end
  
  def trailer_logo
    # Once I can find a source for trailer clips,
    # to be inserted in the view ala <span class="trailer"><span><%= link_to trailer_logo, @imdb_1 %></span> Trailer</span>
    '<img src="data:image/gif;base64,R0lGODlhHwASAIABAI2Njf7+/iH5BAEAAAEALAAAAAAfABIAAAJBjI+py+0PIwK02ovxDID7Dn5i
    2B3ZiVZJuS7s1iqv6cq1jcPxrtN57wMaZsOb0PMLDlPMy4Y0ikJfzSpFgs1qDQUAOw==" alt="Trailer" width="31" height="18" class="video">'.html_safe
  end

end
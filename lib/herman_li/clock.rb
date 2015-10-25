require "clockwork"

module Clockwork
  extend self

    $SONGS = %w(
      https://www.youtube.com/watch?v=-ocvm63GCGE
      https://www.youtube.com/watch?v=FuO3hHwQ-Sc
      https://www.youtube.com/watch?v=FjV8SHjHvHk
      https://www.youtube.com/watch?v=_9h3jRaZyB4
      https://www.youtube.com/watch?v=3FFTQRmsK0k
      https://www.youtube.com/watch?v=fkMBO1IZkBo
      https://www.youtube.com/watch?v=9GFI6Rf-IkI
      https://www.youtube.com/watch?v=_Qy59hKIc4A
      https://www.youtube.com/watch?v=LvB2MnIIdMw
      https://www.youtube.com/watch?v=LGBUJL5uS_c
      https://www.youtube.com/watch?v=xt0V0_1MS0Q
      https://www.youtube.com/watch?v=LatorN4P9aA
      https://www.youtube.com/watch?v=qv96yJYhk3M
      https://www.youtube.com/watch?v=mcXYz0gtJeM
      https://www.youtube.com/watch?v=X9jDQdocqCI
      https://www.youtube.com/watch?v=H063tac_lQo
      https://www.youtube.com/watch?v=LuhLVl5qf2A
      https://www.youtube.com/watch?v=XbDG7ToV_nk
      https://www.youtube.com/watch?v=hiBjCKKEe_E
      https://www.youtube.com/watch?v=pXCpPpPCW4c
      https://www.youtube.com/watch?v=frtJQFe9apw
      https://www.youtube.com/watch?v=zEaxow3PoO0
      https://www.youtube.com/watch?v=s86K-p089R8
      https://www.youtube.com/watch?v=lDK9QqIzhwk
      https://www.youtube.com/watch?v=Gcj34XixuYg
      https://www.youtube.com/watch?v=L397TWLwrUU
      https://www.youtube.com/watch?v=qfKPKluQuXA
      https://www.youtube.com/watch?v=NOGMQ-ySqOY
      https://www.youtube.com/watch?v=85SXoONRKAw
      https://www.youtube.com/watch?v=SwYN7mTi6HM
      https://www.youtube.com/watch?v=2Dq-k_jzEtI
      https://www.youtube.com/watch?v=XBxlAATrd-E
      https://www.youtube.com/watch?v=btPJPFnesV4
      https://www.youtube.com/watch?v=bnNWUUZ7cEA
      https://www.youtube.com/watch?v=nwmCOSYUSlI
      https://www.youtube.com/watch?v=aatjerFCRP8
      https://www.youtube.com/watch?v=2he3PAXV2Jg
      https://www.youtube.com/watch?v=poYf-P9WAXM
      https://www.youtube.com/watch?v=HuEzobimWy8
      https://www.youtube.com/watch?v=ru-AlSO9REw
      https://www.youtube.com/watch?v=W54gF6QxeqM 
      https://www.youtube.com/watch?v=J8eLoCtHB4E
      https://www.youtube.com/watch?v=OOASEZW2tYk
      https://www.youtube.com/watch?v=t5sQTAzzt6s
      https://www.youtube.com/watch?v=xrHFknW-i64
      https://www.youtube.com/watch?v=-If2r9ENQfA
      https://www.youtube.com/watch?v=ybGOT4d2Hs8
      https://www.youtube.com/watch?v=34Udmn2EtzY
      https://www.youtube.com/watch?v=dwZuFexTy0k
      https://www.youtube.com/watch?v=FTQbiNvZqaY
      https://www.youtube.com/watch?v=9uh__MTM0pQ
      https://www.youtube.com/watch?v=D_xkQAxyf-o
      https://www.youtube.com/watch?v=C4SJ-76spgE
      https://www.youtube.com/watch?v=gUkB43t4iho
      https://www.youtube.com/watch?v=rG1vuyz6Fb0
      https://www.youtube.com/watch?v=VI_F5oWkIro
      https://www.youtube.com/watch?v=yrmkI-L_KIQ
      https://www.youtube.com/watch?v=y_jdksFN5Vc
      https://www.youtube.com/watch?v=SRwrg0db_zY
      https://www.youtube.com/watch?v=nDEcMyEM-BQ
    )

  handler do |job|
    send :tweet
  end

  every(1.minutes, 'less.frequent.job')

  def tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = $config["consumer_key"]
      config.consumer_secret = $config["client_secret"]
      config.access_token = $config["access_token"]
      config.access_token_secret = $config["access_token"]
    end

    client.update(creative_sentence())
  end

  def creative_sentence
    sentence = <<- EOS
      HR/HM この曲を聴け!
      #{get_song}
    EOS
    sentence
  end

  def get_song
    song = Random.rand($SONGS.length)
  rescue => e
    # ごきげんだぜ
    # https://www.youtube.com/watch?v=YLKIENnW30w
    song = "https://www.youtube.com/watch?v=YLKIENnW30w"
  end


end

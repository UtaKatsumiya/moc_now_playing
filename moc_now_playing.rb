# -*-coding: utf-8 -*-
# moc_now_playing
# mocで再生中の楽曲情報をツイートするmikutterコマンドを追加するプラグイン
# mocp -iで情報を取得してます

Plugin.create(:moc_now_playing) {
	command(:now_playing,
	        condition: lambda { |opt| true},
	        name: "なうぷれ",
	        visible: true,
	        role: :timeline) { |opt|
			Service.primary.post(message: "#NowPlaying " + %x[ mocp -i | grep Artist | cut -c 9- ].chomp + " - " + %x[ mocp -i | grep SongTitle | cut -c 12- ])
}
}

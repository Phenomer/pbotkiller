# -*- coding: utf-8 -*-

# 最後にユーザ名を書いているタイプのパクりbotを疑われるツイートを
# 非表示にする頭の悪いプラグイン

def filter(msg)
  if msg.message.to_s.match(/.+\s+([a-zA-Z0-9_]{2,32})\s*$/)
    Plugin.activity(:system, <<-EOS
この位置に出力する予定だったTweetには著作権者の著作権を侵害する恐れのある要素が含まれています。
当TLでは著作権者保護の観点により Tweetの表示をおこないません。 - Match: #{$1}
EOS
                    )
    return nil
  else
    return msg
  end
end

Plugin.create(:mute_word) do
  filter_show_filter do |msgs|
    [msgs.select{|m| filter(m)}]
  end
end


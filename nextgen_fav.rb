# -*- coding: utf-8 -*-

Plugin.create(:nextgen_fav) do
  command(:nextgen_fav,
    name: '★を送る',
    condition: Plugin::Command[:HasOneMessage],
    visible: true,
    role: :timeline) do |opt|
      m = opt.messages.first
      if m.repliable?
        Service.primary.post(
          :message => "@#{m.user.idname} ★",
          :replyto => m)
      else
        notice "ツイートに★を送れません-- @#{m.user}:#{m.to_s} (m.parma_link)"
      end
  end
end

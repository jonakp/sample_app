module UsersHelper

  # $B0z?t$GM?$($i$l$?%f!<%6!<$N(BGravatar$B2hA|$rJV$9(B
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

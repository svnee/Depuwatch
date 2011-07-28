module DeputiesHelper
  def facebook_button(slug)
    return (slug.nil? || slug.empty?) ? "<!-- This user has no facebook -->" : "<a href='https://facebook.com/#{slug}' ><img src='/images/facebook_btn.png' /></a>"
  end
  
  def twitter_button(slug)
    return (slug.nil? || slug.empty?) ? "<!-- This user has no twitter -->" : "<a href='https://twitter.com/#{slug}' ><img src='/images/twitter_btn.png' /></a>"
  end
end

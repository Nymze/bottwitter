require 'twitter'
require 'pry'

# quelques lignes qui enregistrent les clés d'APIs

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "KEY"
  config.consumer_secret     = "KEY"
  config.access_token        = "KEY"
  config.access_token_secret = "KEY"
end
p client

# 1 er Fonction / Tweet Bonjour Monde : 

# client.update("Bonjour Monde !")



# 2 eme Fonction / LIKE LES POST D'UNE LISTE DE NOMS 

myArray = ["@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@seizar","@Elodie_legeay"] #array de noms

myArray.each do |x|   			#pour chaque nom dans l'arret :
tweets = client.user_timeline(x)#va chercher les tweets les plus recent par ID
puts (tweets) 					#inscrit l'ID du tweet 
client.favorite(tweets) 	#aime les tweets de la liste créée  tweets = ID du tweet
end

#Streaming de tweet

client2 = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "KEY"
  config.consumer_secret     = "KEY"
  config.access_token        = "KEY"
  config.access_token_secret = "KEY"
end
p client


=begin

# 3 eme fonction  / #scan les tweets avec le #ruby, prend les 3 derniers et leur tweet "@username : Hey I love Ruby too"


client.search('#ruby').take(3).each do |tweet| 
 client.update("@#{tweet.user.screen_name}: Hey I love Ruby too :)")

end

=end

# 4 eme Fonction : Stream les tweets avec coffee et tea in it  & les imprime dans la console.

=begin 

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end


=end 

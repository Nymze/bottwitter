
require 'twitter'
require 'pry'

# quelques lignes qui enregistrent les clés d'APIs

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "WG5bImKUh7EKuLmmAgBZLQ8SR"
  config.consumer_secret     = "3dbDmRk3vDQrdnHRi6fVgtdaLOT2F4KUAI9G4UDYYGEt2FCupr"
  config.access_token        = "953597265276436480-jqL2lhaTxNgmT2twH823gYDb1HRDZvK"
  config.access_token_secret = "LKqOtmAWf0Ngwl6Hc9yqFTTwu4f1hUSQyjRf60C69bAIB"
end
p client


# LIKE LES POST D'UNE LISTE DE NOMS 

myArray = ["@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@seizar","@Elodie_legeay"] #array de noms

myArray.each do |x|   			#pour chaque nom dans l'arret :
tweets = client.user_timeline(x)#va chercher les tweets les plus recent par ID
puts (tweets) 					#inscrit l'ID du tweet 
client.favorite(tweets) 	#aime les tweets de la liste créée 
end

=begin

#scan les tweets avec le #ruby, prend les 3 derniers et leur tweet "@username : Hey I love Ruby too"
client.search('#ruby').take(3).each do |tweet| 
 client.update("@#{tweet.user.screen_name}: Hey I love Ruby too :)")

end

=end

#Streaming de tweet

client2 = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "WG5bImKUh7EKuLmmAgBZLQ8SR"
  config.consumer_secret     = "3dbDmRk3vDQrdnHRi6fVgtdaLOT2F4KUAI9G4UDYYGEt2FCupr"
  config.access_token        = "953597265276436480-jqL2lhaTxNgmT2twH823gYDb1HRDZvK"
  config.access_token_secret = "LKqOtmAWf0Ngwl6Hc9yqFTTwu4f1hUSQyjRf60C69bAIB"
end
p client


=begin --- Stream all tweets & RT with coffee and tea in it 

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end


=end 









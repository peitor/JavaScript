#TODO
# Follow links only on same domain
# Ignore links like: "mailto:", "https:"
# Truncate anchors '#'

#DONE
# Exclude links like "javascript:"


page = require('webpage').create()
system = require 'system'

getRandomLink = (links) ->
  i = parseInt( Math.random() * (links.length+1))
  console.log '  ' +  i
  newLink = links[i]
  if newLink.substring(0, 11) == "javascript:"
     return getRandomLink links
  else
    return newLink


getAddress = (address) -> 
  console.log('Getting: ' + address + ' ... ')
  t = Date.now()
  page.open address, (status) ->
    if status isnt 'success'
      console.log(' FAIL to load the address')
      phantom.exit 2
    else
      t = Date.now() - t
      console.log(' Page title is ' + page.evaluate( (-> document.title) ))
      console.log(' Loading time ' + t + ' msec')
      results = page.evaluate ->
        links = []
        list = document.querySelectorAll 'a'
        for item in list
          links.push(item.href)
        return links
      console.log(' Links in page: ' + results.length)
      getAddress getRandomLink results


if system.args.length is 1
  console.log 'Usage: fuzztester.coffee <some URL>'
  phantom.exit 1
else
  address = system.args[1]
  getAddress address

  
 
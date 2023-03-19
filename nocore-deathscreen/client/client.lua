AddEventHandler('nocore-deathscreen:updateState', function(sentState, sentTime)
  SendReactMessage('updateTimer', sentTime or 300)
  SendReactMessage('setVisible', sentState)
end)

AddEventHandler('nocore-deathscreen:updateTimer', function(sentTime)
  SendReactMessage('updateTimer', sentTime)
end)

import * as React from 'react'
import { useEffect } from 'react'

export const About: React.FC = () => {
  useEffect(() => {
    document.title = 'prototip-2 - about'
  })
  return(
    <div>
      about dayo
    </div>
  )
}


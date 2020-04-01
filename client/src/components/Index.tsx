import * as React from 'react'
import { useEffect } from 'react'

export const Index: React.FC = () => {
  useEffect(() => {
    document.title = 'prototip-2'
  })
  return(
    <div>
      index dayo
    </div>
  )
}

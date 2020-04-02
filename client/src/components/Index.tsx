import * as React from 'react'
import { useEffect } from 'react'

const Index: React.FC = () => {
  useEffect(() => {
    document.title = 'prototip-2'
  })
  return(
    <div>
      index dayo
    </div>
  )
}

export default Index

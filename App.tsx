import React from 'react'
import { Container, Text } from 'native-base'
import PlaidAuthenticator from 'react-native-plaid-link'
import { StyleSheet } from 'react-native'

export default function App() {
  return (
    <Container>
      <Container>
        <PlaidAuthenticator
          onMessage={console.log}
          publicKey="d027c32082e6626f6fcf209d39510d"
          env="sandbox"
          product="auth,transactions"
          clientName="Block Coin"
          selectAccount={false}
        />
      </Container>
    </Container>
  );
}

const styles = StyleSheet.create({
  link: {
    marginTop: 599,
  }
})


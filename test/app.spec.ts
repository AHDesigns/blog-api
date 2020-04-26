import app from 'src/app';

describe('amazing integration tests', () => {
  it('test something about the about of the app', () => {
    expect(app.listen).toEqual(expect.any(Function));
  });
});

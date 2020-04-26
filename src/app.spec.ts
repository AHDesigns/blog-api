import app from './app';

it('exports an app', () => {
  expect(app.listen).toEqual(expect.any(Function));
});
